DROP DATABASE IF EXISTS ventas_db;

CREATE DATABASE ventas_db;
USE ventas_db;

CREATE TABLE Cliente (
    id_cliente VARCHAR(8) NOT NULL,
    nombre_cliente VARCHAR(100) NOT NULL,
    direc_cliente VARCHAR(255) NOT NULL,
    num_telef_cliente VARCHAR(15),
    PRIMARY KEY (id_cliente)
);

CREATE TABLE Producto (
    id_producto VARCHAR(8),
    nombre_producto VARCHAR(100) NOT NULL,
    descripcion_producto TEXT NOT NULL,
    precio_producto DECIMAL(10, 2) NOT NULL,
    stock_producto INT NOT NULL,
    PRIMARY KEY (id_producto)
);

CREATE TABLE Trabajadora (
    id_trabajadora VARCHAR(8) NOT NULL,
    nombre_trabajadora VARCHAR(100) NOT NULL,
    apellido_trabajadora VARCHAR(100) NOT NULL,
    edad_trabajadora INT NOT NULL,
    domicilio_trabajadora VARCHAR(255) NOT NULL,
    tiempo_trabajando INT NOT NULL,
    num_telef_trabajadora VARCHAR(15),
    PRIMARY KEY (id_trabajadora)
);

CREATE TABLE Proveedor (
    id_proveedor VARCHAR(8) NOT NULL,
    nombre_proveedor VARCHAR(100) NOT NULL,
    num_telef_proveedor VARCHAR(15),
    email_proveedor VARCHAR(100),
    tiempo_espera_triaje INT,
    PRIMARY KEY (id_proveedor)
);

CREATE TABLE Venta (
    id_venta VARCHAR(8) NOT NULL,
    fecha_venta DATE NOT NULL,
    monto_total DECIMAL(10, 2) NOT NULL,
    descuentos DECIMAL(10, 2),
    PRIMARY KEY (id_venta)
);

CREATE TABLE Producto_Cliente (
    id_cliente VARCHAR(8) NOT NULL,
    id_producto VARCHAR(8) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

CREATE TABLE Trabajadora_Producto (
    id_trabajadora VARCHAR(8) NOT NULL,
    id_producto VARCHAR(8) NOT NULL,
    FOREIGN KEY (id_trabajadora) REFERENCES Trabajadora(id_trabajadora),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

CREATE TABLE Producto_Venta (
    id_producto VARCHAR(8) NOT NULL,
    id_venta VARCHAR(8) NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
    FOREIGN KEY (id_venta) REFERENCES Venta(id_venta)
);

