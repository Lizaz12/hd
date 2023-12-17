-- Создание хаба "Производители"
CREATE TABLE ManufacturerHub (
    ManufacturerHubKey SERIAL PRIMARY KEY,
    ManufacturerName VARCHAR(255) NOT NULL
);

-- Создание хаба "Поставщики"
CREATE TABLE SupplierHub (
    SupplierHubKey SERIAL PRIMARY KEY,
    SupplierName VARCHAR(255) NOT NULL,
    SupplierAddress VARCHAR(255),
    SupplierContact VARCHAR(20)
);

-- Создание хаба "Автомобили"
CREATE TABLE CarHub (
    CarHubKey SERIAL PRIMARY KEY,
    Model VARCHAR(255) NOT NULL,
    ProductionYear INT,
    Color VARCHAR(50),
    Price DECIMAL(10, 2)
);

-- Создание хаба "Клиенты"
CREATE TABLE CustomerHub (
    CustomerHubKey SERIAL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Address VARCHAR(255),
    ContactNumber VARCHAR(20)
);

-- Создание таблицы "Продажа"
CREATE TABLE Sales (
    SaleID SERIAL PRIMARY KEY,
    SaleDate DATE,
    SalePrice DECIMAL(10, 2)
);

-- Создание линка "Продажи-Автомобили"
CREATE TABLE SaleCarLink (
    SaleCarLinkKey SERIAL PRIMARY KEY,
    SaleID INT,
    CarHubKey INT,
    LoadDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    IsActive BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (SaleID) REFERENCES Sales(SaleID),
    FOREIGN KEY (CarHubKey) REFERENCES CarHub(CarHubKey)
);

-- Создание линка "Продажи-Клиенты"
CREATE TABLE SaleCustomerLink (
    SaleCustomerLinkKey SERIAL PRIMARY KEY,
    SaleID INT,
    CustomerHubKey INT,
    LoadDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    IsActive BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (SaleID) REFERENCES Sales(SaleID),
    FOREIGN KEY (CustomerHubKey) REFERENCES CustomerHub(CustomerHubKey)
);

-- Создание линка "Автомобили-Производители"
CREATE TABLE CarManufacturerLink (
    CarManufacturerLinkKey SERIAL PRIMARY KEY,
    CarHubKey INT,
    ManufacturerHubKey INT,
    LoadDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    IsActive BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (CarHubKey) REFERENCES CarHub(CarHubKey),
    FOREIGN KEY (ManufacturerHubKey) REFERENCES ManufacturerHub(ManufacturerHubKey)
);

-- Создание линка "Автомобили-Поставщики"
CREATE TABLE CarSupplierLink (
    CarSupplierLinkKey SERIAL PRIMARY KEY,
    CarHubKey INT,
    SupplierHubKey INT,
    LoadDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    IsActive BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (CarHubKey) REFERENCES CarHub(CarHubKey),
    FOREIGN KEY (SupplierHubKey) REFERENCES SupplierHub(SupplierHubKey)
);

