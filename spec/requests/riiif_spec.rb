RSpec.describe 'IIIF image API' do
  let(:user) { create(:user) }
  let(:work) { create(:work_with_one_file, user: user) }
  let(:file_set) { work.ordered_members.to_a.first }
  before do
    Hydra::Works::AddFileToFileSet.call(file_set,
                                        fixture_file('images/world.png'),
                                        :original_file)
  end
  let(:file) { file_set.original_file }
  let(:size) { '300,' }

  describe 'GET /images/{id}' do
    context "when the user is authorized" do
      it "returns an image" do
        login_as user
        get Riiif::Engine.routes.url_helpers.image_path(file.id, size: size)
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq 'image/jpeg'
      end
    end

    context "when the user is not authorized" do
      it "returns an image" do
        get Riiif::Engine.routes.url_helpers.image_path(file.id, size: size)
        expect(response).to have_http_status(:unauthorized)
        expect(response.content_type).to eq 'image/jpeg'
      end
    end
  end
end
