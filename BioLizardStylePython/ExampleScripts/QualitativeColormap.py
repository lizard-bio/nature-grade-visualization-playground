import seaborn as sns

plt.style.use('lizard_style.mplstyle') #To show off the BioLizard style

# Sample data
data = sns.load_dataset("iris")
# Using the colormap in Seaborn's swarmplot
sns.swarmplot(x="species", y="sepal_length", data=data, palette=biolizard_qualitative_pal.colors)
plt.title('A Flower Plot')
plt.show()

