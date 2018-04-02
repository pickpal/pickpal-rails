Tournament.destroy_all

t = UfcNumberedEvent.create!(name: "UFC 223")
st = UfcNumberedEvent.create!(name: "Main Card", parent: t)

st.fights.make("Max Holloway", "Khabib Nurmagomedov")
st.fights.make("Rose Namajunas", "Joanna Jedrzejczyk")

st = UfcNumberedEvent.create!(name: "FS1 Prelims", parent: t)

st.fights.make("Karolina Kowalkiewicz", "Felice Herrig")

st = UfcNumberedEvent.create!(name: "Early Prelims", parent: t)
st.fights.make("Alex Caceres", "Artem Lobov")



t = UfcNumberedEvent.create!(name: "UFC 224")
st = UfcNumberedEvent.create!(name: "Main Card", parent: t)

st.fights.make("Nunes", "Pennington")
st.fights.make("Souza", "Gastelum")
st.fights.make("Dern", "Cooper")

t = NbaSeason.create!(name: "NBA 2017-18")
