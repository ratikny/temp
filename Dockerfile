# --- ЭТАП 1: Сборка кода ---
# Используем образ с Java Development Kit (JDK) для компиляции
FROM eclipse-temurin:17-jdk-jammy AS builder

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем исходный код в контейнер
COPY . .

# Компилируем Java-код в байт-код (.class файл)
RUN javac Main.java

# --- ЭТАП 2: Запуск приложения ---
# Используем легковесный образ только с Java Runtime Environment (JRE)
FROM eclipse-temurin:17-jre-jammy

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем скомпилированный .class файл из первого этапа
COPY --from=builder /app/Main.class .

# Команда, которая будет выполняться при запуске контейнера
CMD ["java", "Main"]