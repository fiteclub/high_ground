require 'test_helper'

class WarriorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @warrior = warriors(:one)
  end

  test "should get index" do
    get warriors_url
    assert_response :success
  end

  test "should get new" do
    get new_warrior_url
    assert_response :success
  end

  test "should create warrior" do
    assert_difference('Warrior.count') do
      post warriors_url, params: { warrior: { address: @warrior.address, elevation: @warrior.elevation, latitude: @warrior.latitude, longitude: @warrior.longitude, losses: @warrior.losses, ties: @warrior.ties, title: @warrior.title, wins: @warrior.wins } }
    end

    assert_redirected_to warrior_url(Warrior.last)
  end

  test "should show warrior" do
    get warrior_url(@warrior)
    assert_response :success
  end

  test "should get edit" do
    get edit_warrior_url(@warrior)
    assert_response :success
  end

  test "should update warrior" do
    patch warrior_url(@warrior), params: { warrior: { address: @warrior.address, elevation: @warrior.elevation, latitude: @warrior.latitude, longitude: @warrior.longitude, losses: @warrior.losses, ties: @warrior.ties, title: @warrior.title, wins: @warrior.wins } }
    assert_redirected_to warrior_url(@warrior)
  end

  test "should destroy warrior" do
    assert_difference('Warrior.count', -1) do
      delete warrior_url(@warrior)
    end

    assert_redirected_to warriors_url
  end
end
