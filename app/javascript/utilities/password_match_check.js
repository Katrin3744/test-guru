document.addEventListener('turbolinks:load', function () {
    let password_confirmation = document.getElementById('user_password_confirmation')
    if (password_confirmation) {
        password_confirmation.addEventListener('input', checkMatch)
    }
})

function checkMatch() {
    let confirm_password = document.getElementById('user_password_confirmation').value
    let password = document.getElementById('user_password').value
    console.log(document.querySelector('.octicon-x-circle-fill'))
    if (document.querySelector('.octicon-x-circle-fill').classList.contains('hide') && password !== confirm_password
        && confirm_password !== "") {
        document.querySelector('.octicon-x-circle-fill').classList.remove('hide')
        document.querySelector('.octicon-check-circle-fill').classList.add('hide')
    } else if (password === confirm_password && confirm_password !== "") {
        document.querySelector('.octicon-x-circle-fill').classList.add('hide')
        document.querySelector('.octicon-check-circle-fill').classList.remove('hide')
    } else if (confirm_password === "") {
        document.querySelector('.octicon-x-circle-fill').classList.add('hide')
        document.querySelector('.octicon-check-circle-fill').classList.add('hide')
    }
}
