import 'dart:io';

void main() {
  // ---------- Задание 1: Фейсконтроль ----------
  print('--- Задание 1 ---');
  int age = 20;
  if (age >= 18) {
    print('Проходите');
  } else {
    print('Вход запрещен');
  }

  // ---------- Задание 2: Фейсконтроль (интерактивный) ----------
  print('--- Задание 2 ---');
  print('Сколько вам лет?');
  int userAge = int.parse(stdin.readLineSync()!);
  if (userAge >= 18) {
    print('Проходите');
  } else {
    print('Вход запрещен');
  }

  // ---------- Задание 3: Авторизация ----------
  print('--- Задание 3 ---');
  print('Введите логин:');
  String login = stdin.readLineSync()!;
  print('Введите пароль:');
  String password = stdin.readLineSync()!;
  if (login == 'admin' && password == '12345') {
    print('Добро пожаловать!');
  } else {
    print('Неверный логин или пароль');
  }

  // ---------- Задание 4: Банкомат ----------
  print('--- Задание 4 ---');
  int balance = 1000;
  print('1 - Баланс');
  print('2 - Снятие');
  print('3 - Пополнение');
  String choice = stdin.readLineSync()!;
  switch (choice) {
    case '1':
      print('Ваш баланс: $balance');
      break;
    case '2':
      print('Сколько снять?');
      int money = int.parse(stdin.readLineSync()!);
      if (money <= balance) {
        balance = balance - money;
        print('Вы сняли $money. Остаток: $balance');
      } else {
        print('Недостаточно денег');
      }
      break;
    case '3':
      print('Сколько внести?');
      int plus = int.parse(stdin.readLineSync()!);
      balance = balance + plus;
      print('Баланс пополнен. Сейчас: $balance');
      break;
    default:
      print('Нет такого пункта');
  }

  // ---------- Самостоятельная работа: Текстовый квест ----------
  print('--- Текстовый квест ---');
  int health = 100;
  bool hasKey = false;

  print('Добро пожаловать в квест!');
  print('Ты стоишь на развилке. Куда пойдёшь?');
  print('1 - Налево (лес)');
  print('2 - Направо (пещера)');
  String way = stdin.readLineSync()!;

  if (way == '1') {
    print('В лесу тебя встретил волк!');
    print('1 - Атаковать');
    print('2 - Убежать');
    String action = stdin.readLineSync()!;

    if (action == '1') {
      health = health - 40;
      print('Ты победил волка, но потерял 40 здоровья. Здоровье: $health');
      if (health > 0) {
        print('У волка на шее висел ключ. Ты его взял!');
        hasKey = true;
      }
    } else if (action == '2') {
      print('Ты убежал. Ключа у тебя нет.');
    } else {
      print('Неверная команда. Волк потерял к тебе интерес и ушёл.');
    }
  } else if (way == '2') {
    print('В пещере стоит старый сундук.');
    print('1 - Открыть');
    print('2 - Пройти мимо');
    String action = stdin.readLineSync()!;

    if (action == '1') {
      health = health - 60;
      hasKey = true;
      print('В сундуке был ключ, но сработала ловушка! Здоровье: $health');
    } else if (action == '2') {
      print('Ты прошёл мимо. Ключа у тебя нет.');
    } else {
      print('Неверная команда. Ты постоял и ушёл.');
    }
  } else {
    print('Неверная команда. Ты остался на месте.');
  }

  print('');
  print('Ты подошёл к большой двери.');
  if (hasKey && health > 50) {
    print('Ты открыл дверь. Победа!');
  } else if (hasKey) {
    print('Ключ есть, но у тебя мало сил, чтобы открыть тяжёлую дверь.');
  } else {
    print('Дверь заперта. Нужен ключ.');
  }
  print('Конец игры.');
}