tool
extends EditorPlugin

func _enter_tree():
	add_custom_type("QuizMultipleChoice", "Node", preload("Nodes/QuizMultipleChoice.gd"), preload("Icons/QuizMultipleChoice.png"))

func _exit_tree():
	remove_custom_type("QuizMultipleChoice")