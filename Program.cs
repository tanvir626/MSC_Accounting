using Accounting_Module.Interface;
using Accounting_Module.Repository;
using Accounting_Module.Service;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddScoped<IAccount_Crud_Out, SAccounts_Crud_Out>();
builder.Services.AddScoped<IAccount_Repository_Out, Account_Repository_Out>();


builder.Services.AddScoped<IAccounts_Crud_In, SAccounts_Crud_In>();
builder.Services.AddScoped<IAccount_Repository_In, Account_Repository_In>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseRouting();

app.UseAuthorization();

app.MapStaticAssets();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=AccountList}/{id?}")
    .WithStaticAssets();


app.Run();
