FROM python:3.6
ADD ./calculadora.py calculadora.py
ENTRYPOINT [ "python", "calculadora.py" ]