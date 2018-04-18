# MIT License
#
# Copyright (c) 2018 Matías Muñoz Espinoza
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

tool
extends "QuizBase.gd"

enum Type {TRUE_OR_FALSE = 2, THREE_OPTIONS, FOUR_OPTIONS}
export (Type) var type = Type.TRUE_OR_FALSE setget , get_type 

# Pregunta str
var question = "" setget set_question, get_question
# Array de str de las alternativas
var alternatives = []
# Array que dice que respuesta es correcta o no
var is_correct_answer = []

# Número máximo de respuestas correctas (normalmente es una respuesta correcta).
# Pero pueden existir más de una respuesta correcta.
var max_num_correct_answer = 0
# Numero actual de respuestas correctas ¿Cuántas respuestas correctas tiene
# en este momento?
var current_num_correct_answer = 0
# Como resultado de la pregunta y las respuestas, ¿Es correcto?
var result = false setget , get_result

signal correct_answer
signal incorrect_answer

# Opcional
var points

func _ready():
	if self.debug:
		connect("correct_answer", self, "_on_correct_answer")


# Métodos Públicos
#

func select_answer(num_answer):
	if num_answer == is_correct_answer[num_answer]:
		current_num_correct_answer += 1
	else:
		current_num_correct_answer -= 1
	
	# Ver si en este momento el resultado es correcto o no
	if max_num_correct_answer == current_num_correct_answer:
		result = true
	else:
		result = false
	
# Recibe un texto con la alternativa, y también si esta es correcta o no.
func add_alternative(alternative, is_correct):
	alternatives.append(alternative)
	is_correct_answer.append(is_correct)
	
	if is_correct:
		max_num_correct_answer += 1
	
	match alternatives.size():
		3:
			type = Type.THREE_OPTIONS
		4:
			type = Type.FOUR_OPTIONS
	

# Setters/Getters
#

func set_question(_question):
	question = _question
	
func get_question():
	return question

func get_type():
	return type
	
func get_result():
	return result

# Métodos "Privados"
#

# Eventos
#

func _on_correct_answer():
	debug("_on_correct_answer")