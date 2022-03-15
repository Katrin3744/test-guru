document.addEventListener('turbolinks:load', function () {
    const password_match_check = document.querySelector('.password-match-check')

    if (password_match_check) {
        const password_match = document.querySelectorAll('input[type="password"]')
        const icon_not_match = document.querySelector('.octicon-x-circle-fill')
        const icon_match = document.querySelector('.octicon-check-circle-fill')

        function checkMatch() {
            const icon_not_match_class_list = icon_not_match.classList
            const icon_match_class_list = icon_match.classList

            const password = password_match.item(0).value
            const confirm_password = password_match.item(1).value

            if (icon_not_match_class_list.contains('hide') && password !== confirm_password && confirm_password !== "") {
                icon_not_match_class_list.remove('hide')
                icon_match_class_list.add('hide')
            } else if (password === confirm_password && confirm_password !== "") {
                icon_not_match_class_list.add('hide')
                icon_match_class_list.remove('hide')
            } else if (confirm_password === "") {
                icon_not_match_class_list.add('hide')
                icon_match_class_list.add('hide')
            }
        }

        password_match_check.addEventListener('input', checkMatch)
    }
})
