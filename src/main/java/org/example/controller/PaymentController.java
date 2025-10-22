package org.example.controller;

import lombok.RequiredArgsConstructor;
import org.example.model.Payment;
import org.example.service.PaymentService;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.time.LocalDateTime;

@RestController
@RequestMapping("/api/payments")
@RequiredArgsConstructor
public class PaymentController {

    private final PaymentService paymentService;

    @GetMapping
    public Flux<Payment> getAll() {
        return paymentService.getAll();
    }

    @GetMapping("/user/{userId}")
    public Flux<Payment> getByUser(@PathVariable Long userId) {
        return paymentService.getByUser(userId);
    }

    @PostMapping
    public Mono<Payment> create(@RequestBody Payment payment) {
        return paymentService.create(payment);
    }

    @PutMapping("/{id}/status")
    public Mono<Payment> updateStatus(@PathVariable Long id, @RequestParam String status) {
        return paymentService.updateStatus(id, status);
    }
}