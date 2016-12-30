class AddPreviousStateToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :previous_state, index: true
    add_foreign_key :comments, :states, column: :previous_state_id
    # add_reference :comments, :previous_state, foreign_key: true
    # add_reference :comments, :previous_state, index: true,
      # foreign_key: {to_table: :states}
  end
end
