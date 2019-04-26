FROM python:3.6
ADD ./calculadora.py calculadora.py
RUN pip install flask
ENTRYPOINT [ "python" ]
CMD [ "calculadora.py" ]