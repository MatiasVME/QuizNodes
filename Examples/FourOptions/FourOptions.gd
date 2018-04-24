extends Node

func _ready():
	# Si se le agregan 4 opciones al QuizMultipleChoice entonces se transfoma en
	# un FOUR_OPTIONS
	$FourOptions.set_question("¿Qué es un Objeto en programación?")
	$FourOptions.add_alternative("Una palabra reservada", false) # Alternativa 0
	$FourOptions.add_alternative("Una clase", false) # Alternativa 1
	$FourOptions.add_alternative("La instancia de una clase", true) # Alternativa 2
	$FourOptions.add_alternative("Un evento", false) # Alternativa 3
	
	$FourOptions.unsort_alternatves()
	
	$Question.text = $FourOptions.get_question()
	$Option1.text = $FourOptions.get_alternative(0)
	$Option2.text = $FourOptions.get_alternative(1)
	$Option3.text = $FourOptions.get_alternative(2)
	$Option4.text = $FourOptions.get_alternative(3)

func _on_Option1_pressed():
	$FourOptions.select_answer(0)
	$Answer.text = str("¿Respuesta correta?: ", $FourOptions.get_result())

func _on_Option2_pressed():
	$FourOptions.select_answer(1)
	$Answer.text = str("¿Respuesta correta?: ", $FourOptions.get_result())

func _on_Option3_pressed():
	$FourOptions.select_answer(2)
	$Answer.text = str("¿Respuesta correta?: ", $FourOptions.get_result())

func _on_Option4_pressed():
	$FourOptions.select_answer(3)
	$Answer.text = str("¿Respuesta correta?: ", $FourOptions.get_result())
