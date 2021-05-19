require 'rails_helper'

describe('root', type: :feature, js: true, multithread: true) do
  it '表示' do
    # トップページを開く
    visit '/' # root_path
    expect(page).to have_content 'Hosts'
  end
end
