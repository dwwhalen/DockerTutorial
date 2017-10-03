class HomePage
  include PageObject

  page_url 'http://localhost:3000'

  text_field(:student_id, id: 'student-id')
  text_field(:student_first_name, id: 'first-name')
  text_field(:student_last_name, id: 'last-name')
  table(:the_table, class: ['table', 'table-striped'])

  button(:submit_button, value: 'Submit')

  def table_row_count
    the_table_element.rows
  end

end