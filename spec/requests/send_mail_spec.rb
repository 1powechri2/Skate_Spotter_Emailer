require 'rails_helper'

describe 'User visits the mail endpoint' do
  it 'gets an email sent to the specified email address' do
    email = 'chris.ian.powell@gmail.com'

    get "/mail_skater?email=#{email}"

    resp = JSON.parse(response.body)

    expect(resp["SUCCESS"]).to eq("Your Mail Has Been Sent")
  end
end
