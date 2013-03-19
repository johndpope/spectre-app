require 'spec_helper'

describe "IncidentMonitors" do

  subject { page }

  describe "index" do

    let(:user) { FactoryGirl.create(:user) }

    describe "when monitor is active" do
      let!(:monitor) { FactoryGirl.create(:bid_layering_monitor) }

      before do
        sign_in user
        visit incident_monitors_path
      end

      it { should have_selector('title', text: 'Incident Monitors') }
      it { should have_selector('h1', text: 'Incident Monitors') }

      it { should have_link(JSON.parse(monitor.desc)["name"]) }
      it { should have_selector('a', :'data-parent' => 'monitors' ) }
      it { should have_selector('td', text: 'Active') }
      it { should_not have_selector('td', text: 'Inactive') }

      it { should have_content('description') }

      it { should have_selector('td', text: 'Number of new bids') }
      it { should have_selector('td', text: '4') }

      it { should have_link('Edit Settings') }

      describe "and the monitor edit settings button is clicked" do
        before { click_link 'Edit Settings' }

        it { should have_selector('h3', text: 'Edit monitor settings for') }
        it { should have_selector('h3', text: JSON.parse(monitor.desc)["name"])}

        it { should have_selector('label', for: 'number-of-new-bids') }
        it { should have_content('Number of new bids') }
        it { should have_selector('input', value: 99) }

        it { should have_selector('label', for: 'number-of-cancels') }
        it { should have_content('Number of cancels') }
        it { should have_selector('input', value: 4) }

        it { should have_selector('label',
               for: 'bid-prices-must-be-in-increasing-order') }
        it { should have_content('Bid prices must be in increasing order') }
        it { should have_selector('input', value: 'true') }

        it { should have_selector('label', for: 'length-of-monitoring-window') }
        it { should have_content('Length of monitoring window') }
        it { should have_selector('input', value: 5) }

        it { should have_button('Save') }
        it { should have_button('Cancel') }

        describe "and valid changes are made and the save button is clicked" do
          before do
            fill_in "Number of new bids", with: "10"
            click_button "Save"
          end

          it { should have_selector('div.alert.alert-success',
               text: 'Settings for Layering on the bid modified') }

        end

        describe "and invalid changes are made and the save button is
                  clicked" do
          before do
            fill_in "Number of new bids", with: ""
            click_button "Save"
          end

          it { should have_content("can't be blank") }
        end

        describe "and no changes are made and the save button is clicked" do
          before { click_button "Save" }

          it { should have_selector('div.alert') }
        end

        describe "and the cancel button is clicked" do
          before { click_button "Cancel" }

          it { should have_selector('h1', text: 'Incident Monitors') }
          it { should_not have_selector('div.alert') }
        end
      end
    end
  end
end
