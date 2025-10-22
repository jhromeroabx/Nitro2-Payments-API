package org.example.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.servers.Server;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.util.List;

@Configuration
public class OpenApiConfig {

    /**
     * Configuración base de Swagger UI / OpenAPI.
     * Detecta el host dinámicamente según la request (localhost, AWS, etc.).
     */
    @Bean
    public OpenAPI customOpenAPI() {
        return new OpenAPI()
                .info(new Info()
                        .title("Nitro2 Payments API")
                        .version("1.0.0")
                        .description("API Reactiva con Spring Boot, R2DBC y PostgreSQL (Aiven)")
                );
    }

    /**
     * Bean para inyectar dinámicamente el host en tiempo de ejecución.
     * (Usado por Swagger UI para armar las URLs base.)
     */
    @Bean
    public org.springdoc.core.customizers.OpenApiCustomizer dynamicServerUrlCustomizer() {
        return openApi -> {
            // No definimos servidores estáticos — se resuelve dinámicamente en runtime.
            openApi.setServers(List.of(new Server().url("/")));
        };
    }

    /**
     * Esta función puede inyectarse más adelante si quisieras mostrar el host actual
     * directamente en los endpoints del Swagger.
     */
    public static Mono<String> resolveCurrentBaseUrl(ServerWebExchange exchange) {
        var request = exchange.getRequest();
        return Mono.just(String.format("%s://%s", request.getURI().getScheme(), request.getHeaders().getHost()));
    }
}
