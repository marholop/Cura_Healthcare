# Cura_Healthcare

Repository ini berisi implementasi **Robot Framework** untuk automasi testing menggunakan **SeleniumLibrary**.

## 🚀 How to Run Locally

### 1. Clone Repository
```bash
git clone https://github.com/marholop/Cura_Healthcare.git
cd Cura_Healthcare

```
### 2. Install Dependecies
```bash
python -m pip install --upgrade pip
pip install robotframework
pip install --upgrade robotframework-seleniumlibrary
pip install git+https://github.com/robotframework/SeleniumLibrary.git
pip install webdriver-manager
```

## How To Run Test Case

### 1. Run all test case
```bash
robot test\
```
### 2. Run spesific test case
```bash
robot -t "Make Valid Appointment After Login First" tests\appointment.robot
```
### 3. Run spesific test suite
```bash
robot tests\appointment.robot
```
