document.addEventListener('turbolinks:load', function () {
    const control = document.querySelector('.timer-progress')
    if (control) {
        const timeStart = Number(control.dataset.timeSinceStart)
        let allTime = control.dataset.timeForTest
        let timer = 0
        let timerId
        if (allTime === "unlimited time") {
            control.innerHTML = allTime
        } else {
            allTime = Number(allTime)
            timer = 0
            timeProgress()
            timerId = setInterval(timeProgress, 1000)
        }

        function timeProgress() {
            timer = timer + 1
            if (timeStart + timer < allTime) {
                const minutes = Math.floor(((timeStart + timer) / 60))
                let seconds = (timeStart + timer).toFixed(0)
                if (seconds < 10) {
                    seconds = "0" + seconds
                }
                control.innerHTML = minutes + ":" + seconds + "/" + Math.floor(allTime / 60) + ":" + "00"
            } else {
                const resultLink = control.dataset.linkToResult
                clearInterval(timerId)
                window.location = resultLink

            }
        }
    }
})
