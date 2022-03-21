document.addEventListener('turbolinks:load', function () {
    const control = document.querySelector('.test-passage-progress')
    if (control) {
        const currentQuestionNumber = control.dataset.numberCurrentQuestion
        const numberOfQuestions = control.dataset.numberOfQuestions
        const width = currentQuestionNumber * 100 / numberOfQuestions
        control.style.width = width + "%";
        control.innerHTML = width + "%";
    }
})
