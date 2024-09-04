using System.IO;
using System.Text;
using Newtonsoft.Json;

namespace PlanningHelper
{
    public class DataRetriever
    {
        private static string APP_DATA_FOLDER = Path.Combine(
            Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData),
            "Wim"
        );

        private static string APP_DATA_GENERAL = Path.Combine(APP_DATA_FOLDER, "app.data");
        private static string APP_DATA_PLANNING_HELPER = Path.Combine(APP_DATA_FOLDER, "planningHelper.data");
        
        public static string[] GetDailyTodos()
        {
            string[] content = File.ReadAllLines(APP_DATA_PLANNING_HELPER);

            StringBuilder stringBuilder = new StringBuilder();

            foreach (string line in content)
            {
                stringBuilder.Append(line);
            }

            string contentString = stringBuilder.ToString();

            if (string.IsNullOrEmpty(contentString))
            {
                return Array.Empty<string>();
            }

            try
            {
                HelpingPlannerData data = JsonConvert.DeserializeObject<HelpingPlannerData>(contentString);
                
                if (data != null && data.dailyTodos != null)
                {
                    return data.dailyTodos;
                }
                else
                {
                    return Array.Empty<string>();
                }
            }
            catch (JsonException)
            {
                return Array.Empty<string>();
            }
        }
    }

    public class HelpingPlannerData
    {
        public string[] dailyTodos { get; set; } = Array.Empty<string>();

        public HelpingPlannerData() { }

        public HelpingPlannerData(string[] dailyTodos)
        {
            this.dailyTodos = dailyTodos;
        }
    }
}