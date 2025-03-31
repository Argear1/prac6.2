using Microsoft.VisualStudio.TestTools.UnitTesting;
using salon_krasoti;
using System;

namespace UnitTestProject2
{
    [TestClass]
    public class PegTest
    {
        [TestMethod]
        public void RegTestSuccess()
        {
            var regPage = new RegPage();
            bool result = regPage.Register(
                "Argear",
                "Ilya",
                "Sergeev",
                "ilya@gmail.com",
                "+79123456999",
                "Ilya12345!",
                "Ilya12345!");

            Assert.IsTrue(result, "Регистрация должна быть успешной при корректных данных");
        }

        [TestMethod]
        public void RegTestExistingEmail()
        {
            var regPage = new RegPage();
            bool result = regPage.Register(
                "ann2",
                "Анна",
                "Петрова",
                "ivan@example.com",
                "+79123456780",
                "Anna12345",
                "Anna12345");

            Assert.IsFalse(result, "Регистрация должна завершиться ошибкой при существующем email");
        }

        [TestMethod]
        public void RegTestNumericPassword()
        {
            var regPage = new RegPage();
            bool result = regPage.Register(
                "totty",
                "Екатерина",
                "Сидорова",
                "katya@example.com",
                "+79123456781",
                "1234567890",
                "1234567890");

            Assert.IsFalse(result, "Регистрация должна завершиться ошибкой при пароле из только цифр");
        }

        [TestMethod]
        public void RegTestExistingLogin()
        {
            var regPage = new RegPage();
            bool result = regPage.Register(
                "totty",
                "Елена",
                "Кузнецова",
                "elena@example.com",
                "+79123456782",
                "Elena12345",
                "Elena12345");

            Assert.IsFalse(result, "Регистрация должна завершиться ошибкой при существующем логине");
        }

        [TestMethod]
        public void RegTestShortPassword()
        {
            var regPage = new RegPage();
            bool result = regPage.Register(
                "nataly",
                "Наталья",
                "Волкова",
                "nataly@example.com",
                "+79123456783",
                "Nat12",
                "Nat12");

            Assert.IsFalse(result, "Регистрация должна завершиться ошибкой при коротком пароле");
        }
    }
}
