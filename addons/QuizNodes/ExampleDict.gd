extends Node

var example_dict := {
	"Category1" : {
		"SubCategory1" : {
			"Question1" : {
				"Question" : "How are you?",
				"PosibleAnswer": {
					1 : "Fine",
					2 : "I'am not well",
					3 : "I'am very good",
					4 : "Very, very bad"
				},
				"CorrectAnswers" : [2, 4],
				"AddPoints" : 1,
				"AddXP" : 1
			},
			"Question2" : {
				"Question" : "Are you programer?",
				"PosibleAnswer": {
					1 : "Yes",
					2 : "No",
					3 : "Nope",
					4 : ":S"
				},
				"CorrectAnswers" : [1, 4],
				"AddPoints" : 1,
				"AddXP" : 1
			},
			"Question3" : {
				"Question" : "123?",
				"PosibleAnswer": {
					1 : "321",
					2 : "123",
					3 : "231",
					4 : "132"
				},
				"CorrectAnswers" : [2],
				"AddPoints" : 1,
				"AddXP" : 1
			}
		},
		"SubCategory2" : {
			"Question1" : {
				"Question" : "How old are you?",
				"PosibleAnswer": {
					1 : "< 18",
					2 : "> 18"
				},
				"CorrectAnswers" : [1],
				"AddPoints" : 1,
				"AddXP" : 1
			},
		}
	},
	"Category2" : {
		"SubCategory1" : {
			"Question1" : {
				"Question" : "Whats is your name?",
				"PosibleAnswer": {
					1 : "Matias",
					2 : "Miguel",
					3 : "Carla",
					4 : "Lorena"
				},
				"CorrectAnswers" : [1],
				"AddPoints" : 1,
				"AddXP" : 1
			}
		}
	}
}
