-- ============================================================
-- NITRO2 PAYMENTS API - ESQUEMA DE BASE DE DATOS (PostgreSQL)
-- Autor: Jhosep Romero
-- Fecha: 2025-10-21
-- ============================================================

-- 💡 Si estás en una base vacía, crea primero el schema (opcional)
CREATE SCHEMA IF NOT EXISTS public;

-- ============================================================
-- 🧍 TABLA: USERS
-- ============================================================
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL
);

COMMENT ON TABLE users IS 'Usuarios del sistema Nitro2 Payments API';

-- ============================================================
-- 💰 TABLA: PAYMENTS
-- ============================================================
CREATE TABLE IF NOT EXISTS payments (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    amount NUMERIC(12,2) NOT NULL CHECK (amount >= 0),
    status VARCHAR(30) DEFAULT 'PENDING',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE payments IS 'Pagos registrados en el sistema';

-- ============================================================
-- ⚡ ÍNDICES
-- ============================================================
CREATE INDEX IF NOT EXISTS idx_payments_user_id ON payments(user_id);
CREATE INDEX IF NOT EXISTS idx_payments_status ON payments(status);

-- ============================================================
-- 🔹 DATOS DE PRUEBA
-- ============================================================
INSERT INTO users (name, email)
VALUES
    ('Carlos Mendez', 'carlos.mendez@example.com'),
    ('Lucía Torres', 'lucia.torres@example.com'),
    ('Ana Delgado', 'ana.delgado@example.com')
ON CONFLICT DO NOTHING;

INSERT INTO payments (user_id, amount, status)
VALUES
    (1, 120.50, 'PENDING'),
    (1, 85.00, 'CONFIRMED'),
    (2, 49.99, 'PENDING'),
    (3, 15.25, 'FAILED')
ON CONFLICT DO NOTHING;

-- ============================================================
-- ✅ FIN DE SCHEMA
-- ============================================================
