require 'rails_helper'

RSpec.describe 'case_assignments/edit', type: :view do
  before do
    @case_assignment = assign(:case_assignment, CaseAssignment.create!(
                                                  volunteer_id: 1,
                                                  casa_case_id: '',
                                                  is_active: false
                                                ))
  end

  it 'renders the edit case_assignment form' do # rubocop:todo RSpec/ExampleLength
    render

    assert_select 'form[action=?][method=?]', case_assignment_path(@case_assignment), 'post' do # rubocop:todo RSpec/InstanceVariable
      assert_select 'input[name=?]', 'case_assignment[volunteer_id]'

      assert_select 'input[name=?]', 'case_assignment[casa_case_id]'

      assert_select 'input[name=?]', 'case_assignment[is_active]'
    end
  end
end