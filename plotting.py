import matplotlib.pyplot as plt

def show_histogram(data, bins=100, title=''):
    plt.figure()
    plt.hist(data.flat, bins=bins)
    plt.title(title)

def show_five_histograms(datalist, titlelist, bins=100):
    fig = plt.figure()
    ax1 = fig.add_subplot(231)
    ax2 = fig.add_subplot(232)
    ax3 = fig.add_subplot(234)
    ax4 = fig.add_subplot(235)
    ax5 = fig.add_subplot(133)
    
    ax1.hist(datalist[0].flat, bins=bins)
    ax1.set_title(titlelist[0])
    ax2.hist(datalist[1].flat, bins=bins)
    ax2.set_title(titlelist[1])
    ax3.hist(datalist[2].flat, bins=bins)
    ax3.set_title(titlelist[2])
    ax4.hist(datalist[3].flat, bins=bins)
    ax4.set_title(titlelist[3])
    ax5.hist(datalist[4].flat, bins=bins)
    ax5.set_title(titlelist[4])
    
def show(): plt.show()
