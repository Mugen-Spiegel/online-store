# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Spree::Order, type: :model do
  let(:store) { create(:store) }
  let(:user) { create(:user, email: "solidus@example.com") }
  let(:order) { create(:order, user: user, store: store) }

  context '#store' do
    it { is_expected.to respond_to(:store) }

    context 'when there is no store assigned' do
      subject { Spree::Order.new }

      context 'when there is no default store' do
        it "will not be valid" do
          expect(subject).not_to be_valid
        end
      end

      context "when there is a default store" do
        let!(:store) { create(:store) }

        it { is_expected.to be_valid }
      end
    end

    context 'when a store is assigned' do
      subject { Spree::Order.new(store: create(:store)) }
      it { is_expected.to be_valid }
    end
  end

  context "#currency" do
    context "when object currency is ABC" do
      before { order.currency = "ABC" }

      it "returns the currency from the object" do
        expect(order.currency).to eq("ABC")
      end
    end

    context "when object currency is nil" do
      before { order.currency = nil }

      it "returns the globally configured currency" do
        expect(order.currency).to eq("USD")
      end
    end
  end

  context "#completed?" do
    it "should indicate if order is completed" do
      order.completed_at = nil
      expect(order.completed?).to be false

      order.completed_at = Time.current
      expect(order.completed?).to be true
    end
  end

  context "#allow_checkout?" do
    it "should be true if there are line_items in the order" do
      allow(order).to receive_message_chain(:line_items, count: 1)
      expect(order.checkout_allowed?).to be true
    end
    it "should be false if there are no line_items in the order" do
      allow(order).to receive_message_chain(:line_items, count: 0)
      expect(order.checkout_allowed?).to be false
    end
  end
end