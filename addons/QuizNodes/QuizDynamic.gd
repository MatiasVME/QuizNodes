# MIT License
#
# Copyright (c) 2018 - 2020 Matías Muñoz Espinoza
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

extends QuizBase

class_name QuizDynamic, "QuizDynamic.png"

# QuizDinamic es un Quiz Dinámico que se puede leer desde un archivo, json
# o incluso encriptado. Para esto es necesario el plugin PersistenceNode
# que esta incluido.

# Esta constante almacena el nombre de fichero de test
const QUESTION_TEST = "QuestionTest"

# Accesso al nodo de persistencia para poder almacenar y cargar la data
onready var persistence = Persistence.new()

# Diccionario con la data actual
var current_data
# Preguntas
var questions := []
# Numero de la pregunta actual, empieza en 0
var current_question := 0

signal get_question(question_num)
signal correct_answer
signal incorrect_answer


# Desde donde se leen las preguntas y respuestas
func read_from(file_name, category, sub_category, random := true):
	if not category:
		.debug("Invalid category")
		return
		
	if not sub_category:
		.debug("Invalid sub_category")
		return
	
	for question in current_data[file_name][category][sub_category].keys():
		questions.append(current_data[file_name][category][sub_category][question])
	
	if random:
		randomize()
		questions.shuffle()


# Obtiene la pregunta actual o la indicada por parametro
func get_question(num = null):
	if num:
		emit_signal("get_question", num)
		return questions[num]["Question"]
		
	emit_signal("get_question", current_question)
	return questions[current_question]["Question"]


# Pasa a la siguiente pregunta
func next_question():
	if current_question + 1 < questions.size():
		current_question += 1


# Obtiene la respuesta numero answer_num
func get_answer(answer_num):
	return questions[current_question]["PosibleAnswer"][answer_num]


# Pregunta si la respuesta answer_num es correcta o no
func is_correct(answer_num):
	if questions[current_question]["CorrectAnswers"].has(answer_num):
		emit_signal("correct_answer")
		return true
		
	emit_signal("incorrect_answer")
	return false


# Obtiene la cantidad de respuestas de la pregunta actual
func get_answer_amount():
	return questions[current_question]["PosibleAnswer"].size()


# Obtiene la cantidad de preguntas actuales
func get_question_amount():
	return questions.size()


# Pregunta si es la última pregunta o no
func is_last_question():
	return questions.size() == current_question + 1


# Crea una estructura básica para el json de preguntas y respuestas
func create_test():
	persistence.set_folder_name("Questions")
	
	if self.debug:
		persistence.mode = Persistence.Mode.TEXT
	else:
		persistence.mode = Persistence.Mode.ENCRYPTED
	
	current_data = persistence.get_data(QUESTION_TEST)
	var script = load("res://addons/QuizNodes/ExampleDict.gd").new()
	current_data[QUESTION_TEST] = script.example_dict
	persistence.save_data(QUESTION_TEST)
