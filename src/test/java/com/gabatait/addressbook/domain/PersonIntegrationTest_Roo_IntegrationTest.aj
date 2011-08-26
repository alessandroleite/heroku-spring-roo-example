// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.gabatait.addressbook.domain;

import com.gabatait.addressbook.domain.PersonDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PersonIntegrationTest_Roo_IntegrationTest {
    
    declare @type: PersonIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: PersonIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: PersonIntegrationTest: @Transactional;
    
    @Autowired
    private PersonDataOnDemand PersonIntegrationTest.dod;
    
    @Test
    public void PersonIntegrationTest.testCountPeople() {
        org.junit.Assert.assertNotNull("Data on demand for 'Person' failed to initialize correctly", dod.getRandomPerson());
        long count = com.gabatait.addressbook.domain.Person.countPeople();
        org.junit.Assert.assertTrue("Counter for 'Person' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void PersonIntegrationTest.testFindPerson() {
        com.gabatait.addressbook.domain.Person obj = dod.getRandomPerson();
        org.junit.Assert.assertNotNull("Data on demand for 'Person' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Person' failed to provide an identifier", id);
        obj = com.gabatait.addressbook.domain.Person.findPerson(id);
        org.junit.Assert.assertNotNull("Find method for 'Person' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Person' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void PersonIntegrationTest.testFindAllPeople() {
        org.junit.Assert.assertNotNull("Data on demand for 'Person' failed to initialize correctly", dod.getRandomPerson());
        long count = com.gabatait.addressbook.domain.Person.countPeople();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Person', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<com.gabatait.addressbook.domain.Person> result = com.gabatait.addressbook.domain.Person.findAllPeople();
        org.junit.Assert.assertNotNull("Find all method for 'Person' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Person' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void PersonIntegrationTest.testFindPersonEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Person' failed to initialize correctly", dod.getRandomPerson());
        long count = com.gabatait.addressbook.domain.Person.countPeople();
        if (count > 20) count = 20;
        java.util.List<com.gabatait.addressbook.domain.Person> result = com.gabatait.addressbook.domain.Person.findPersonEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'Person' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Person' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void PersonIntegrationTest.testFlush() {
        com.gabatait.addressbook.domain.Person obj = dod.getRandomPerson();
        org.junit.Assert.assertNotNull("Data on demand for 'Person' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Person' failed to provide an identifier", id);
        obj = com.gabatait.addressbook.domain.Person.findPerson(id);
        org.junit.Assert.assertNotNull("Find method for 'Person' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyPerson(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Person' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PersonIntegrationTest.testMerge() {
        com.gabatait.addressbook.domain.Person obj = dod.getRandomPerson();
        org.junit.Assert.assertNotNull("Data on demand for 'Person' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Person' failed to provide an identifier", id);
        obj = com.gabatait.addressbook.domain.Person.findPerson(id);
        boolean modified =  dod.modifyPerson(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        com.gabatait.addressbook.domain.Person merged =  obj.merge();
        obj.flush();
        org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'Person' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PersonIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Person' failed to initialize correctly", dod.getRandomPerson());
        com.gabatait.addressbook.domain.Person obj = dod.getNewTransientPerson(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Person' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Person' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Person' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void PersonIntegrationTest.testRemove() {
        com.gabatait.addressbook.domain.Person obj = dod.getRandomPerson();
        org.junit.Assert.assertNotNull("Data on demand for 'Person' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Person' failed to provide an identifier", id);
        obj = com.gabatait.addressbook.domain.Person.findPerson(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Person' with identifier '" + id + "'", com.gabatait.addressbook.domain.Person.findPerson(id));
    }
    
}
