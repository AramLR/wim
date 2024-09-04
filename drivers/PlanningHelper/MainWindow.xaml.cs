using System.Diagnostics;
using System.Windows;

namespace PlanningHelper
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            string[] todos = DataRetriever.GetDailyTodos();

        }
    }
}