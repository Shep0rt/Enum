//
//  main.swift
//  Enum
//
//  Created by Pavel Michka on 21.11.2022.
//

import Foundation

//
//Задание 1
//
//1) В конце главы про «Перечисления» мы с вами начали создавать перечисление ArithmeticExpression, позволяющее выполнять арифметические операции. Сейчас перед вами стоит задача доработать данное перечисление, чтобы оно могло производить любые арифметические операции, включая сложение, вычитание, умножение, деление и возведение в степень.
//2) Проверьте работу перечисления на произвольных примерах
enum ArithmeticExpression {
    case number (Double)
    indirect case addition (ArithmeticExpression, ArithmeticExpression)
    indirect case subtraction (ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication (ArithmeticExpression, ArithmeticExpression)
    indirect case division (ArithmeticExpression, ArithmeticExpression)
    indirect case exponentiate (ArithmeticExpression, ArithmeticExpression)
    func evaluate (_ expression: ArithmeticExpression? = nil) -> Double {
        switch expression ?? self {
        case let .number(value):
            return value
        case let .addition(valueLeft, valueRight):
            return evaluate(valueLeft) + evaluate(valueRight)
        case .subtraction(let valueLeft, let valueRight):
            return evaluate(valueLeft) - evaluate(valueRight)
        case let .multiplication(valueLeft, valueRight):
            return evaluate(valueLeft) * evaluate(valueRight)
        case let .division(valueLeft, valueRight):
            return evaluate(valueLeft) / evaluate(valueRight)
        case let .exponentiate(valueLeft, valueRight):
            return pow(evaluate(valueLeft), evaluate(valueRight))
        }
    }
}
let hardExpr = ArithmeticExpression.addition(.number(20), .subtraction(.number(10), .number(34)))
let hardExpr2 = ArithmeticExpression.addition(.number(20), .multiplication(.number(2), .number(4)))
let hardExpr3 = ArithmeticExpression.addition(.number(20), .division(.number(10), .number(2)))
let hardExpr4 = ArithmeticExpression.addition(.number(20), .exponentiate(.number(2), .number(2)))
hardExpr.evaluate()
hardExpr2.evaluate()
hardExpr3.evaluate()
hardExpr4.evaluate()

//Задание 2
//Корректно ли будет выполнен данный код? Если нет, то какие правки необходимо в него внести, чтобы исправить ошибки?
enum Seasons{
    case winter, spring, summer, autumn
}
let whiteSeason = Seasons.winter
var greenSeason: Seasons = .spring
greenSeason = .summer
//var orangeSeason = .autumn
var orangeSeason = Seasons.autumn
var bestSeason = whiteSeason
bestSeason = .summer
//ошибка в orangeSeason, не указан тип

//Задание 3
//Простейшая модель сущности «Шахматная фигура» может быть выполнена с помощью перечисления.
//1) Создайте перечисление Chessman, члены которого определяют возможные типы шахматных фигур (всего 6 типов, без учета цвета).
//2) Внутри перечисления Chessman создайте перечисление Color, определяющее возможные цвета шахматных фигур.
//3) Для каждого члена перечисления Chessman создайте связанный параметр типа Color, позволяющий указать цвет шахматной фигуры
//4) Создайте несколько экземпляров типа Chessman, каждый из которых описывает свою шахматную фигуру
//5) Напишите конструкции switch-case, способную обрабатывать параметр типа Chessman и выводить на консоль информацию о типе и цвете фигуры
//6) Создайте новую переменную и инициализируйте ей значение типа Color, вложенного в перечисление Chessman
enum Chessman {
    case King (color: Color)
    case Rook (color: Color)
    case Queen (color: Color)
    case Elephant (color: Color)
    case Horse (color: Color)
    case Pawn (color: Color)
    enum Color {
        case white
        case black
    }
}
let chess1: Chessman = .King(color: .white)
let chess2: Chessman = .Queen(color: .black)

switch chess2 {
case .King(color: .white):
    print("Это белый Король")
case .King(color: .black):
    print("Это черный Король")
case .Queen(color: .white):
    print("Это белый Ферзь")
case .Queen(color: .black):
    print("Это черный Ферзь")
case .Rook(color: .white):
    print("Это белая Ладья")
case .Rook(color: .black):
    print("Это черная Ладья")
case .Elephant(color: .white):
    print("Это белый Слон")
case .Elephant(color: .black):
    print("Это черный Слон")
case .Horse(color: .white):
    print("Это белый Конь")
case .Horse(color: .black):
    print("Это черный Конь")
case .Pawn(color: .white):
    print("Это белая пешка")
case .Pawn(color: .black):
    print("Это черная пешка")
}
//Задание 4
//
//1) Создайте перечисление Day, члены которого указывают на дни недели.
//В составе перечисления создайте вычисляемое свойство, которое возвращает наименование дня недели на русском языке (значение типа String), соответсвующее выбранному члену перечисления
//2) Проверьте работу перечисления с помощью следующих выражений
//
//let mon = Day.monday
//print(mon.label) // Понедельник
//print(Day.friday.label) // Пятница
enum Day: String {
    case Monday = "Понедельник"
    case Tuesday = "Вторник"
    case Wedneday = "Среда"
    case Thursday = "Четверг"
    case Friday = "Пятница"
    case Saturday = "Суббота"
    case Sunday = "Воскреенье"
    var label: String {rawValue}
}
let mon = Day.Monday
print(mon.label)
print(Day.Friday.label)


