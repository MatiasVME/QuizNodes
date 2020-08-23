extends Control

func _ready():
	$QuizDynamic.create_test()

	$QuizDynamic.read_from($QuizDynamic.QUESTION_TEST, "Category1", "SubCategory1")
	
	$QuizDynamic.connect("get_question", self, "_on_get_question")
	$QuizDynamic.connect("correct_answer", self, "_on_correct_answer")
	$QuizDynamic.connect("incorrect_answer", self, "_on_incorrect_answer")
	
	new_question()


func new_question():
	$VBox/Question.text = $QuizDynamic.get_question()


func disable_all(disabled := true):
	for button in $VBox/Grid.get_children():
		button.disabled = disabled
		

func wait_for_next_question():
	yield(get_tree().create_timer(3.0), "timeout")
		
	$QuizDynamic.next_question()
	new_question()
	disable_all(false)


func _on_get_question(num):
	$VBox/Grid/Opt1.text = $QuizDynamic.get_answer(1)
	$VBox/Grid/Opt2.text = $QuizDynamic.get_answer(2)
	$VBox/Grid/Opt3.text = $QuizDynamic.get_answer(3)
	$VBox/Grid/Opt4.text = $QuizDynamic.get_answer(4)


func _on_correct_answer():
	$VBox/Question.text = "Is Correct!"
	disable_all()
	
	if not $QuizDynamic.is_last_question():
		wait_for_next_question()
	else:
		$VBox/Question.text = "Bye!!"


func _on_incorrect_answer():
	$VBox/Question.text = "Is Incorrect!" 
	disable_all()
	
	if not $QuizDynamic.is_last_question():
		wait_for_next_question()
	else:
		$VBox/Question.text = "Bye!!"
		yield(get_tree().create_timer(3.0), "timeout")

func _on_Opt1_pressed():
	$QuizDynamic.is_correct(1)


func _on_Opt2_pressed():
	$QuizDynamic.is_correct(2)


func _on_Opt3_pressed():
	$QuizDynamic.is_correct(3)


func _on_Opt4_pressed():
	$QuizDynamic.is_correct(4)
