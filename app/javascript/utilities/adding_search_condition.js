document.addEventListener('turbolinks:load', function () {
    const rule = document.querySelector('.badge-rule')

    if (rule) {

        function hide(form_element, control_element) {
            form_element.classList.add('hide');
            control_element.setAttribute('disabled', '')
        }

        function show(form_element, control_element) {
            form_element.classList.remove('hide');
            control_element.removeAttribute('disabled')
        }


        const category_field = document.querySelector('.badge-field-category')
        const category_control = category_field.querySelector('select')
        const test_field = document.querySelector('.badge-field-test')
        const test_control = test_field.querySelector('select')
        const level_field = document.querySelector('.badge-field-level')
        const level_control = level_field.querySelector('input')

        function addParamsChoose(event) {
            const rule_id = event.target.value
            switch (Number(rule_id)) {
                case 1:
                    if (category_field.classList.contains('hide')) {
                        show(category_field, category_control)
                        hide(test_field, test_control)
                        hide(level_field, level_control)
                    }
                    break
                case 2:
                    hide(category_field, category_control)
                    hide(test_field, test_control)
                    hide(level_field, level_control)
                    break
                case 3:
                    if (level_field.classList.contains('hide')) {
                        hide(category_field, category_control)
                        hide(test_field, test_control)
                        show(level_field, level_control)
                    }
                    break
                case 4:
                    if (test_field.classList.contains('hide')) {
                        hide(category_field, category_control)
                        show(test_field, test_control)
                        hide(level_field, level_control)
                    }
                    break
            }
        }

        rule.addEventListener('change', addParamsChoose)

    }
})