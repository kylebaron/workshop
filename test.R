

x <- parse_handson("handson.R")
x$numbers$question[[1]]


undebug(write_questions)
workshop:::write_questions(x, "work_questions.R")
workshop:::write_answers(x, "work_answers.R")



























