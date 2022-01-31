$(document).ready(function () {
    $("#quiz_question").hide();
    $("#quiz_choice").hide();
    $("#nextQuestion").hide();
    $("#goToScore").hide();
    $("#score").hide();
    var optionsDiv = document.getElementById("quiz_choice");
    let currentQuestion;
    let score ;

    $("#start_quiz").click(function () {
        $("#start_quiz").hide();
        $("#quiz_question").show();
        $("#quiz_choice").show();
        $("#nextQuestion").show();
        $("#score").hide();
        currentQuestion = 0;
        score = 0;
        showQuestion();
    });

    $("#nextQuestion").click(function() {
        currentQuestion++;
        showQuestion();
    });

    $("#goToScore").click(function() {
        $('#quiz_question').hide();
        $('#score').show();
        $('#quiz_choice').hide();
        $("#goToScore").hide();
        $("#start").text("Restart");
        $("#start_quiz").show();
        $("#score").text("Your Score is " +score+ "/5");
    });

    function showQuestion() {
        $('#quiz_choice').text('');
        const queText = questions[currentQuestion].question;
        $("#quiz_question").text(queText);
        $("#nextQuestion").addClass("disabled");

        questions[currentQuestion].option.forEach(option => {
            var optionButton = document.createElement("button");
            var blankLine = document.createElement("span");
            optionButton.classList.add("btn", "btn-secondary");
            optionButton.innerText = option.text;
            optionButton.style.width = '100%';

            blankLine.innerHTML = "<br>"

            if (option.correct) {
                optionButton.dataset.correct = option.correct;
            }
            optionButton.addEventListener('click', tickOption);
            $("#quiz_choice").append(optionButton);
            $("#quiz_choice").append(blankLine);
        });

    }

    function tickOption(e) {
        e.target.classList.add('border');
        Array.from(optionsDiv.children).forEach(option => {
            optionColor(option, option.dataset.correct);
        });
        if(e.target.dataset.correct) {
            score++;
        }
        if(currentQuestion >= questions.length-1) {
            $("#nextQuestion").hide();
            $("#goToScore").show();
            
        }

    }

    function optionColor(element, correct) {
        if (correct) {
            element.style.background='#008000';
        } else {
            element.style.background='#FF0000';
        }
        Array.from(optionsDiv.children).forEach(option => {
            option.classList.add('disabled');
        });
        $("#nextQuestion").show();
        $("#nextQuestion").removeClass("disabled");
    }

    const questions = [
        {
            question: 'Which of these best describes an array',
            option: [
                { text: 'A data structure that shows a hierarchical behavior', correct: false },
                { text: 'Container of objects of similar types', correct: true },
                { text: 'Arrays are immutable once initialised', correct: false },
                { text: 'Array is not a data structure', correct: false }
            ]
        },
        {
            question: 'Which data structure allows deleting data elements from front and inserting at rear?',
            option: [
                { text: 'Stack', correct: false },
                { text: 'List', correct: false },
                { text: 'Queues', correct: true },
                { text: 'Binary Tree', correct: false }
            ]
        },
        {
            question: 'The TCP/IP protocol suite consists of _______ layers.',
            option: [
                { text: 'Three', correct: false },
                { text: 'Five', correct: true },
                { text: 'Seven', correct: false },
                { text: 'Eight', correct: false }
            ]
        },
        {
            question: 'What is the older high-level(non-assembler) programming language?',
            option: [
                { text: 'C', correct: false },
                { text: 'Lisp', correct: false },
                { text: 'Fortan', correct: true },
                { text: 'Basic', correct: false }
            ]
        },
        {
            question: 'Which one of the following error will be handle by the operating system?  ',
            option: [
                { text: 'Power failure', correct: false },
                { text: 'Lack of paper in printer', correct: false },
                { text: 'Connection failure in the network', correct: false },
                { text: 'All of the mentioned', correct: true }
            ]
        }
    ]
});