package org.example.service;

import lombok.RequiredArgsConstructor;
import org.example.model.Payment;
import org.example.repository.PaymentRepository;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
public class PaymentService {

    private final PaymentRepository paymentRepository;

    public Flux<Payment> getAll() {
        return paymentRepository.findAll();
    }

    public Flux<Payment> getByUser(Long userId) {
        return paymentRepository.findByUserId(userId);
    }

    public Mono<Payment> create(Payment payment) {
        payment.setCreatedAt(LocalDateTime.now());
        payment.setStatus("PENDING");
        return paymentRepository.save(payment);
    }

    public Mono<Payment> updateStatus(Long id, String newStatus) {
        return paymentRepository.findById(id)
                .flatMap(p -> {
                    p.setStatus(newStatus);
                    return paymentRepository.save(p);
                });
    }
}
