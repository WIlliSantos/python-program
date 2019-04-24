import calculadora
import unittest

class TesteCalc(unittest.TestCase):
	def test_soma(self):
		resultadoSoma = calculadora.soma(5, 10)
		self.assertEqual(resultadoSoma, 15)

	def test_multiplicacao(self):
		resultadoMultiplicacao = calculadora.multiplicacao(2, 2)
		self.assertEqual(resultadoMultiplicacao, 4)

	def test_subtracao(self):
		resultadoSubtracao = calculadora.subtracao(10, 5)
		self.assertEqual(resultadoSubtracao, 5)

	def test_divisao(self):
		resultadoDivisao = calculadora.divisao(30,3)
		self.assertEqual(resultadoDivisao, 10)

if __name__ == '__main__':
	unittest.main()