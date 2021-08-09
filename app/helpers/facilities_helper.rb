module FacilitiesHelper
  def choose_new_or_edit
    if action_name == 'new'
      confirm_facilities_path
    elsif action_name == 'edit'
      facility_path
    end
  end
end
