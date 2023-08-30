
select * from CovidDeaths$

select location, date, total_cases, new_cases, total_deaths, population
from CovidDeaths$ order by 1,2

-- Total Cases vs Total Deaths

select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from CovidDeaths$
where continent is not null 
order by 1,2

-- Total Cases vs Population

select location, date, total_cases, population, (total_cases/population)*100 as DeathPercentage
from CovidDeaths$ 
where continent is not null
order by 1,2

-- Counteries with Highest Infection

select location, max(total_cases) as Highest_Infection from CovidDeaths$
where continent is not null
group by location
order by 1,2

-- Counteries with Highest Death

select location, max(cast(total_deaths as int)) as Highest_Death from CovidDeaths$
where continent is not null
group by location
order by 1,2

-- Break things down with Continents

select continent, max(total_cases) as Highest_Infection from CovidDeaths$
where continent is not null
group by continent
order by 1,2

-- Continents with Highest Death

select continent, max(cast(total_deaths as int)) as Highest_Death from CovidDeaths$
where continent is not null
group by continent
order by 1,2

-- Sum of Global Cases

select location, sum(new_cases) as New_Cases, sum(total_cases) as Total_Cases from CovidDeaths$
where continent is not null
group by location
order by 1,2

-- Covid Vaccinations

select * from CovidVaccinations$

select * from CovidDeaths$ dea join CovidVaccinations$ vac
on dea.location = vac.location

-- Total Population vs Vaccinations

select dea.continent, dea.location, dea.population, dea.date, vac.new_vaccinations 
from CovidDeaths$ dea join CovidVaccinations$ vac
on dea.location = vac.location
where dea.continent is not null
order by 1,2,3

