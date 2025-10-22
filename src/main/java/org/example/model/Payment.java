package org.example.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDateTime;

@Data
@Table("payments")
@NoArgsConstructor
@AllArgsConstructor
public class Payment {

    @Id
    private Long id;

    @Column("user_id")
    private Long userId;  // ⚠️ debe ser Long, no String

    private Double amount;
    private String status;

    @Column("created_at")
    private LocalDateTime createdAt;
}
