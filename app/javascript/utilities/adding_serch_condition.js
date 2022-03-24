document.addEventListener('turbolinks:load', function () {
    const control = document.querySelector('.badge-search-condition')
    if (control) {
        function addParamsChoose(event) {
            const rule_id = event.target.value
            switch (rule_id) {
                case 1:
                    if (category_field.classList.contains('hide')) {
                        category_field.classList.remove('hide')
                        test_field.classList.add('hide')
                        level_field.classList.add('hide')
                    }
                    break
                case 2:
                    category_field.classList.add('hide')
                    test_field.classList.add('hide')
                    level_field.classList.add('hide')
                    break
            }
        }

        const category_field = document.querySelector('.badge-field-category')
        const test_field = document.querySelector('.badge-field-test')
        const level_field = document.querySelector('.badge-field-level')
        const rule = document.querySelector('.badge-rule')
        rule.addEventListener('change', addParamsChoose)

    }
})