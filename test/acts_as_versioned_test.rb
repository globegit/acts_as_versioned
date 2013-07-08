require 'test_helper'

class ActsAsVersionedTest < ActiveSupport::TestCase
  test "Basic versioning" do
    assert_kind_of Module, ActsAsVersioned
    doc = Document.new()
    doc.name = "The Hound of the Baskervilles"
    doc.body = "Mr. Sherlock Holmes, who was usually very late in the mornings..."
    doc.comments = "Initial version"
    doc.version_at = Time.at(Time.now.to_i - 600)
    assert doc.save, "Couldn't save document"

    # When only a non-versioned column is changed, and the model is re-saved,
    # there shouldn't be a new version created.
    #
    assert_equal 1, doc.version
    doc.dont_version = 10
	assert_equal true, doc.changed?
    doc.save!
    assert_equal 1, doc.version
	assert_equal false, doc.changed?

    doc.comments = "Sent to editor"
    doc.version_at = Time.at(Time.now.to_i - 400)
    doc.save!
    assert_equal 2, doc.version
  end
end

