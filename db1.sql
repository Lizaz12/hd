-- Создание базы данных auto_salon
CREATE DATABASE auto_salon;
-- Использование базы данных auto_salon
\c auto_salon;

-- Создание таблицы "Производитель"
CREATE TABLE Manufacturers (
    ManufacturerID SERIAL PRIMARY KEY,
    ManufacturerName VARCHAR(255) NOT NULL
);

-- Создание таблицы "Поставщик"
CREATE TABLE Suppliers (
    SupplierID SERIAL PRIMARY KEY,
    SupplierName VARCHAR(255) NOT NULL,
    SupplierAddress VARCHAR(255),
    SupplierContact VARCHAR(20)
);

-- Создание таблицы "Автомобиль"
CREATE TABLE Cars (
    CarID SERIAL PRIMARY KEY,
    Model VARCHAR(255) NOT NULL,
    ManufacturerID INT,
    SupplierID INT,
    ProductionYear INT,
    Color VARCHAR(50),
    Price DECIMAL(10, 2),
    FOREIGN KEY (ManufacturerID) REFERENCES Manufacturers(ManufacturerID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- Создание таблицы "Клиент"
CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Address VARCHAR(255),
    ContactNumber VARCHAR(20)
);

-- Создание таблицы "Продажа"
CREATE TABLE Sales (
    SaleID SERIAL PRIMARY KEY,
    CarID INT,
    CustomerID INT,
    SaleDate DATE,
    SalePrice DECIMAL(10, 2),
    FOREIGN KEY (CarID) REFERENCES Cars(CarID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
