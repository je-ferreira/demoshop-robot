*** Settings ***
Documentation    File to centralize all informations, components and pages used in tests, is just import it.

Library    SeleniumLibrary
Library    String

### components ###
Resource    components/register-components.robot

### data ###
Resource    data/general.robot
Resource    data/register-data.robot

### pages ###
Resource    pages/register-page.robot