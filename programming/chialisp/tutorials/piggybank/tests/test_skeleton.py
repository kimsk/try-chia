import pytest

from cdv.test import setup as setup_test


from piggybank.piggybank_drivers import (
    create_piggybank_puzzle,
    solution_for_piggybank,
    piggybank_announcement_assertion,
)

class TestSomething:
    @pytest.fixture(scope="function")
    async def setup(self):
        network, alice, bob = await setup_test()
        yield network, alice, bob

    @pytest.mark.asyncio
    async def test_something(self, setup):
        network, alice, bob = setup
        await network.farm_block(farmer=alice)
        try:
            pass
        finally:
            await network.close()
