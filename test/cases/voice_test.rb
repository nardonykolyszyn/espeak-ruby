require "test_helper"

class VoiceTest < Test::Unit::TestCase
  include ESpeak

  def setup
    voices_file = File.read("test/fixtures/voices.txt")
    Voice.expects(:espeak_voices).returns(voices_file)
  end

  def test_all
    all_voices = Voice.all
    assert all_voices.size > 0
    assert %w(M F).include?(all_voices.first.gender)
  end

  def test_find_by_language
    voice = Voice.find_by_language('en')
    assert_equal 'en', voice.language
  end
end
