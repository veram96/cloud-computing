import logging
import google.cloud.logging
from flask import Flask, render_template

client = google.cloud.logging.Client()
client.setup_logging()

app = Flask(__name__)

@app.route('/')
def index():
    logging.info("Usuario consulta pagina principal")
    return render_template('welcome.html')

@app.route('/health')
def hc():
    logging.info("Monitoreo activo")
    return render_template('healthcheck.html')

@app.route('/forbidden')
def prohibited():
    logging.error("Intento de acceso no exitoso a contenido restringido")
    return render_template('prohibited.html')

@app.errorhandler(404)
def error(e):
    logging.warning("Intento de acceso a ruta no encontrada")
    return render_template('error.html'), 404


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=8000)