importScript("Minion");
importPackage(com.csc.agility.reports.usage.metrics.dao);
importPackage(com.csc.agility.reports.usage.metrics);
var action = agility.params.get("eventType")
var asset = minion.asset;
minion.logger.info("===asset ==="+asset.assetType.name);
minion.logger.info("\n===action ==="+action);

var blueprint="";
var storeLaunchItems="";
var launchItem="";
var productId="";
var actualPrice=0;
var productType="";
var productName="";
var shortDesc="";
var orderDate="";
var orderBy="";
var topology="";
var project="";
var environment="";
var topologyLoop="";
var instance="";
var template="";
var templateList="";
var cloudProvider="";
var cloudProviderId="";
var creator="";
var created="";
var launchItemDeployments="";
var cpu=0;
var memory=0;
var storage=0;
var duration="";
var period="";
var container="";

if (asset.assetType.name.equals("blueprint")&& action.equals("Create")){
blueprint = asset;
minion.logger.info("=====blueprint===="+blueprint);
storeLaunchItems = minion.launchItems;
for(var i =0 ; i<storeLaunchItems.length; i++)
{
    if(blueprint.getName().equals(storeLaunchItems[i].getName()))
   {
        launchItem  = storeLaunchItems[i];
        productId   = launchItem.product.id;
        actualPrice = launchItem.prices[1].price;
        productType = checkLaunchItemType(launchItem);
        productName = storeLaunchItems[i].getName();
        shortDesc   = storeLaunchItems[i].product.shortDescription;
        OrderDate = launchItem[i].purchasedOn.getTime();
        OrderBy = launchItem[i].purchasedBy.toString();
        break;
   }
}
minion.logger.info("\n===launch item ==="+launchItem);
minion.logger.info("\n===productId ==="+productId);
minion.logger.info("\n===actualPrice ==="+actualPrice);
minion.logger.info("\n===productType ==="+productType);
minion.logger.info("\n===productName ==="+productName);
minion.logger.info("\n===shortDesc ==="+shortDesc);

 if(action.equals("Create"))
{
    minion.logger.info("\n===database entry for monthly and yearly product===");
    createDatabaseEntry();
}
    else
{
    minion.logger.info("===================INVALID ACTION DISCOVERED====================");
}
}

else if(asset.assetType.name.equals("topology")&& (action.equals("Create") || action.equals("Start"))){

topology         = asset;
project          = topology.project;
storeLaunchItems = minion.launchItems;
environment      = topology.environment;

minion.logger.info("\n===topology ==="+topology);
minion.logger.info("\n===storeLaunchItem ==="+storeLaunchItems);
minion.logger.info("\n===Project ==="+project.name);

if (environment==null){
    environment = ""; 
}

else{
    
     topologyLoop     = minion.projects[project.name].children[environment.name].children[topology.name];
     minion.logger.info("\n===TopologyLoop ==="+topologyLoop);
     
if(topologyLoop.children[0]){
  while(topologyLoop.children[0].assetType.name.equals("topology") )
    {
        topologyLoop = topologyLoop.children[0];
    }  
}
}

if(topologyLoop == ""){
    template ="";
    templateList="";
   }
else{
    template     = topologyLoop.children[0];
    templateList = topologyLoop.children; 
    minion.logger.info("\n===Template ==="+template);
}

blueprint    = topology.sourceBlueprint;
minion.logger.info("\n===blueprint ==="+blueprint);

for(var i =0 ; i<storeLaunchItems.length; i++)
{
    if(blueprint.getName().equals(storeLaunchItems[i].getName()))
   {
        launchItem  = storeLaunchItems[i];
        productId   = launchItem.product.id;
        actualPrice = launchItem.prices[1].price;
        productType = checkLaunchItemType(launchItem);
        productName = storeLaunchItems[i].getName();
        shortDesc   = storeLaunchItems[i].product.shortDescription;
        break;
   }
}

minion.logger.info("\n===launch item ==="+launchItem);
minion.logger.info("\n===productId ==="+productId);
minion.logger.info("\n===actualPrice ==="+actualPrice);
minion.logger.info("\n===productType ==="+productType);
minion.logger.info("\n===productName ==="+productName);
minion.logger.info("\n===shortDesc ==="+shortDesc);

container = project.container;
minion.logger.info("\n===container ==="+ container);

if(!(container.name.equals("Root")))
    container = container.parent;

if(template == ""){
    cloudProvider = "";
    cloudProviderId="";
}
else{
     cloudProvider   = template.cloud.name;
     cloudProviderId = template.cloud.id;
}

minion.logger.info("\n===cloudProvider ==="+cloudProvider);
minion.logger.info("\n===cloudProviderId ==="+cloudProviderId);
creator         = topology.creator.name;
created         = topology.created.time;

minion.logger.info("\n===creator ==="+creator);
minion.logger.info("\n===created on==="+created);

launchItemDeployments = minion.launchItemDeployments;

minion.logger.info("\n===LaunchItemDeployments Array ==="+launchItemDeployments);
minion.logger.info("\n===LaunchItemDeployments Array length ==="+launchItemDeployments.length);

for(var i=0;i<launchItemDeployments.length;i++)
{
    minion.logger.info("\n launchItemDeployments[i] name:  "+launchItemDeployments[i].launchItem.name);
    minion.logger.info("\n Topology source blueprint name: "+topology.sourceBlueprint.name);

    if(launchItemDeployments[i].launchItem.name.equals(topology.sourceBlueprint.name))
    {
       launchItemDeployId = launchItemDeployments[i].id;
    }
}
minion.logger.info("\n===launch Item Deployment ID ===" +launchItemDeployId);
for(var i = 0;i<templateList.length; i++)
    {
        cpu     = cpu + templateList[i].cpu.quantity;
        memory  = memory + templateList[i].memory.quantity; 

        for (var j = 0; j< templateList[i].volumes.length ;j++)
        {
            storage = storage + templateList[i].volumes[j].diskSize;
        }
    }

minion.logger.info("\n===Memory ==="+memory);
minion.logger.info("\n===Storage ==="+storage);
minion.logger.info("\n===CPU ==="+cpu);
minion.logger.info("\n===Resources collected ===");

if(action.equals("Create"))
{
    
    if(productType.toString().equals("Monthly")||productType.toString().equals("Yearly"))
    {
        minion.logger.info("\n===database entry for monthly and yearly product===");
        createDatabaseEntry();
    }
}
else if(action.equals("Start"))
{
    instance = template.children[0];
    minion.logger.info("===instance===="+instance);
    minion.logger.info("===topology===="+topology);
    minion.logger.info("===template===="+template);
    if(productType.toString().equals("Hourly") && (instance.state.toString().equals("Running")||instance.state.toString().equals("Starting")))
    {
        minion.logger.info("\n===database entry for hourly product ===");
        createDatabaseEntry();
    }
        
}

else
{
    minion.logger.info("===================INVALID ACTION DISCOVERED====================");
}

}


else{
    minion.logger.info("==========Niether blueplurint nor topology is created=======");
}


function checkLaunchItemType(launchItem)
{
    productType = "";
    duration = launchItem.prices[1].duration;
    period = launchItem.prices[1].period;
 
    
    if(period == 0)
    {
        if(duration < 60)
            {
                productType = "Minutes";
            }
        else
            productType = "Hourly";
    }
    if(period == 1)
        {
            if(duration < 24)
                {
                    productType = "Hourly";
                }
            else
                productType = "Daily";
        }
    if(period == 2)
        {
            if(duration < 365)
                {
                    productType = "Monthly";
                }
            else
                productType = "Yearly";
        }
    return productType;
}

function createDatabaseEntry()
{
    var launchItemDeployment = new LaunchItemDeployment();

    launchItemDeployment.setLaunchItemDeploymentId(launchItemDeployId);
    launchItemDeployment.setContainerId(container.id);
    launchItemDeployment.setContainer(container.name);
    launchItemDeployment.setProjectId(project.id);
    launchItemDeployment.setProject(project.name);
    launchItemDeployment.setEnvironmentId(environment.id);
    launchItemDeployment.setEnvironment(environment.name);
    launchItemDeployment.setProductId(productId);
    launchItemDeployment.setProduct(productName);
    launchItemDeployment.setLaunchItemId(launchItem.id);
    launchItemDeployment.setTotalCPU(cpu);
    launchItemDeployment.setTotalRAM(memory);
    launchItemDeployment.setTotalStorage(storage);
    launchItemDeployment.setActual_price(actualPrice);
    launchItemDeployment.setProductType(productType);
    launchItemDeployment.setCloud(cloudProvider);
    launchItemDeployment.setProductShortDesc(shortDesc);
    launchItemDeployment.setUser(creator);
    var sqlTimestamp = new java.sql.Timestamp(created.getTime())
    launchItemDeployment.setOrderDate(sqlTimestamp);

    var productDeployment = new ProductDeployment();
    productDeployment.create(launchItemDeployment);
}
function updateDatabaseEntry()
{
    var launchItemDeployment = new LaunchItemDeployment();

    launchItemDeployment.setLaunchItemDeploymentId(launchItemDeployId);
    launchItemDeployment.setContainerId(container.id);
    launchItemDeployment.setContainer(container.name);
    launchItemDeployment.setProjectId(project.id);
    launchItemDeployment.setProject(project.name);
    launchItemDeployment.setEnvironmentId(environment.id);
    launchItemDeployment.setEnvironment(environment.name);
    launchItemDeployment.setProductId(productId);
    launchItemDeployment.setProduct(productName);
    launchItemDeployment.setLaunchItemId(launchItem.id);
    launchItemDeployment.setTotalCPU(cpu);
    launchItemDeployment.setTotalRAM(memory);
    launchItemDeployment.setTotalStorage(storage);
    launchItemDeployment.setActual_price(actualPrice);
    launchItemDeployment.setProductType(productType);
    launchItemDeployment.setCloud(cloudProvider);
    launchItemDeployment.setProductShortDesc(shortDesc);
    launchItemDeployment.setUser(creator);
    var sqlTimestamp = new java.sql.Timestamp(created.getTime())
    launchItemDeployment.setOrderDate(sqlTimestamp);

    var productDeployment = new ProductDeployment();
    productDeployment.update(launchItemDeployment);
}