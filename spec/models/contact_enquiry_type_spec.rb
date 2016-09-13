require 'rails_helper'

RSpec.describe ContactEnquiryType, type: :model do
  it { should validate_presence_of :enquiry_type }
  it { should validate_uniqueness_of :enquiry_type }
end
