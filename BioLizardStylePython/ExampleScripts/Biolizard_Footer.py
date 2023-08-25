import seaborn as sns

data = sns.load_dataset("iris")
fig = plt.figure()
sns.swarmplot(x="species", y="sepal_length", data=data)
plt.title('A Flower Plot')

#Will be stored in working directory as TempLizardPlot.pdf
add_custom_footer(fig,
                  'Source: This is a footnote',
                  fontsize=10, pdf=True)